
import Foundation

public struct UnsplashCategory: Codable {
  
  public typealias ID = Tagged<UnsplashCategory, Int>
  
  public var id: ID
  public var title: String
}
