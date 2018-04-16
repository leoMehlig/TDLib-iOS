extension User {
    public var displayName: String {
        if !self.username.isEmpty {
            return self.username
        } else if !self.firstName.isEmpty {
            return self.firstName + " " + self.lastName
        } else if !self.phoneNumber.isEmpty {
            return self.phoneNumber
        } else {
            return "Unknown User"
        }
    }
}
