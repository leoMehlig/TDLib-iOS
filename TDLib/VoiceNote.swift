import Foundation

public extension VoiceNote {
    private static func getBits(data: UnsafeRawPointer, length: Int, bitOffset: Int, numBits: Int) -> Int32 {
        let normalizedNumBits = Int(pow(2.0, Double(numBits))) - 1
        let byteOffset = bitOffset / 8
        let normalizedData = data.advanced(by: byteOffset)
        let normalizedBitOffset = bitOffset % 8

        var value: Int32 = 0
        if byteOffset + 4 > length {
            let remaining = length - byteOffset
            withUnsafeMutableBytes(of: &value, { (bytes: UnsafeMutableRawBufferPointer) -> Void in
                memcpy(bytes.baseAddress!, normalizedData, remaining) //swiftlint:disable:this force_unwrapping
            })
        } else {
            value = normalizedData.assumingMemoryBound(to: Int32.self).pointee
        }
        return (value >> Int32(normalizedBitOffset)) & Int32(normalizedNumBits)
    }

    var waveformSamples: [UInt8] {
        let numSamples = Int(Float(self.waveform.count * 8) / 5)
        var result = Data()
        result.count = numSamples * 2

        self.waveform.withUnsafeBytes { (bytes: UnsafePointer<Int8>) -> Void in
            //let maxSample = (1 << bitsPerSample) - 1

            result.withUnsafeMutableBytes { (samples: UnsafeMutablePointer<Int16>) -> Void in
                let norm = Int64((1 << 5) - 1)
                for i in 0 ..< numSamples {
                    samples[i] = Int16(Int64(VoiceNote.getBits(data: bytes,
                                                               length: self.waveform.count,
                                                               bitOffset: i * 5, numBits: 5)) * norm / norm)
                }
            }
        }
        return !result.isEmpty ? Array(result) : Array(repeating: 1, count: 67)
    }
}
