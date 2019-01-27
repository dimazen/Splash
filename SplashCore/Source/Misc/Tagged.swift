import Foundation

public struct Tagged<Tag, RawValue>: RawRepresentable {
  
  public var rawValue: RawValue
  
  public init(rawValue: RawValue) {
    self.rawValue = rawValue
  }
  
  public func map<T>(to type: T.Type) -> Tagged<T, RawValue> {
    return Tagged<T, RawValue>(rawValue: rawValue)
  }
  
  public func mapValue(_ transform: (RawValue) -> RawValue) -> Tagged {
    return .init(rawValue: transform(rawValue))
  }
  
  public func mapValue(_ transform: @autoclosure () -> RawValue) -> Tagged {
    return .init(rawValue: transform())
  }
}

extension Tagged: Equatable where RawValue: Equatable {
  public static func == (lhs: Tagged, rhs: Tagged) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }
}

extension Tagged: Hashable where RawValue: Hashable {
  
  public var hashValue: Int {
    return rawValue.hashValue
  }
}

extension Tagged: Decodable where RawValue: Decodable {
  
  public init(from decoder: Decoder) throws {
    self.init(rawValue: try RawValue(from: decoder))
  }
}

extension Tagged: Encodable where RawValue: Encodable {
  
  public func encode(to encoder: Encoder) throws {
    try rawValue.encode(to: encoder)
  }
}

extension Tagged: ExpressibleByUnicodeScalarLiteral where RawValue: ExpressibleByUnicodeScalarLiteral {
  
  public typealias UnicodeScalarLiteralType = RawValue.UnicodeScalarLiteralType
  
  public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
    self.init(rawValue: RawValue(unicodeScalarLiteral: value))
  }
}

extension Tagged: ExpressibleByExtendedGraphemeClusterLiteral where RawValue: ExpressibleByExtendedGraphemeClusterLiteral {
  
  public typealias ExtendedGraphemeClusterLiteralType = RawValue.ExtendedGraphemeClusterLiteralType
  
  public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
    self.init(rawValue: RawValue(extendedGraphemeClusterLiteral: value))
  }
}

extension Tagged: ExpressibleByStringLiteral where RawValue: ExpressibleByStringLiteral {
  
  public typealias StringLiteralType = RawValue.StringLiteralType
  
  public init(stringLiteral value: StringLiteralType) {
    self.init(rawValue: RawValue(stringLiteral: value))
  }
}

extension Tagged: ExpressibleByIntegerLiteral where RawValue: ExpressibleByIntegerLiteral {
  
  public typealias IntegerLiteralType = RawValue.IntegerLiteralType
  
  public init(integerLiteral value: IntegerLiteralType) {
    self.init(rawValue: RawValue(integerLiteral: value))
  }
}

extension Tagged: ExpressibleByFloatLiteral where RawValue: ExpressibleByFloatLiteral {
  public typealias FloatLiteralType = RawValue.FloatLiteralType
  
  public init(floatLiteral value: FloatLiteralType) {
    self.init(rawValue: RawValue(floatLiteral: value))
  }
}

extension Tagged: ExpressibleByBooleanLiteral where RawValue: ExpressibleByBooleanLiteral {
  
  public typealias BooleanLiteralType = RawValue.BooleanLiteralType
  
  public init(booleanLiteral value: BooleanLiteralType) {
    self.init(rawValue: RawValue(booleanLiteral: value))
  }
}

extension Tagged: ExpressibleByNilLiteral where RawValue: ExpressibleByNilLiteral {
  
  public init(nilLiteral: ()) {
    self.init(rawValue: RawValue(nilLiteral: nilLiteral))
  }
}

extension Tagged: LosslessStringConvertible where RawValue: LosslessStringConvertible {
  
  public init?(_ description: String) {
    guard let rawValue = RawValue(description) else { return nil }
    self.init(rawValue: rawValue)
  }
}

extension Tagged: Numeric where RawValue: Numeric {
  
  public typealias Magnitude = RawValue.Magnitude
  
  public init?<T>(exactly source: T) where T: BinaryInteger {
    guard let rawValue = RawValue(exactly: source) else { return nil }
    self.init(rawValue: rawValue)
  }
  
  public var magnitude: RawValue.Magnitude {
    return self.rawValue.magnitude
  }
  
  public static func + (lhs: Tagged, rhs: Tagged) -> Tagged {
    return self.init(rawValue: lhs.rawValue + rhs.rawValue)
  }
  
  public static func += (lhs: inout Tagged, rhs: Tagged) {
    lhs.rawValue += rhs.rawValue
  }

  public static func * (lhs: Tagged, rhs: Tagged) -> Tagged {
    return self.init(rawValue: lhs.rawValue * rhs.rawValue)
  }
  
  public static func *= (lhs: inout Tagged, rhs: Tagged) {
    lhs.rawValue *= rhs.rawValue
  }

  public static func - (lhs: Tagged, rhs: Tagged) -> Tagged {
    return self.init(rawValue: lhs.rawValue - rhs.rawValue)
  }
 
  public static func -= (lhs: inout Tagged, rhs: Tagged) {
    lhs.rawValue -= rhs.rawValue
  }
}

extension Tagged: SignedNumeric where RawValue: SignedNumeric {}

extension Tagged: Comparable where RawValue: Comparable {
  
  public static func < (lhs: Tagged, rhs: Tagged) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }
}

extension Tagged: CustomStringConvertible {
  
  public var description: String {
    return String(describing: self.rawValue)
  }
}

extension Tagged: CustomPlaygroundDisplayConvertible {
  
  public var playgroundDescription: Any {
    return self.rawValue
  }
}

extension Tagged: Error where RawValue: Error {}
