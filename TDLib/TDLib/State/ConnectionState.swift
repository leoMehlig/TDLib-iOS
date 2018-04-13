public enum ConnectionState: TDEnum {
    case waitingForNetwork
    case connectingToProxy
    case connecting
    case updating
    case ready
}
