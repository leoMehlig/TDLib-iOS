extension Error: Swift.Error { }

extension Error {
    public var localizedDescriptionIdentifier: String {
        switch (self.code, self.message) {
        case (400, "PHONE_CODE_INVALID"):
            return "Login.InvalidCodeError"
        case (400, "PHONE_NUMBER_INVALID"):
            return "Login.InvalidPhoneError"
        case (429, _):
            return "Login.CodeFloodError"
        default:
            return "Login.UnknownError"
        }
    }
}
