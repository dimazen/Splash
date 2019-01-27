
import Foundation

public struct UnsplashUser: Codable {
  
  public typealias ID = Tagged<UnsplashUser, String>

  public var id: ID
  public var updatedAt: Date
  public var username: String
  public var name: String
  public var profileImageURLs: URLs?

  private enum CodingKeys: String, CodingKey {

    case id, username, name
    case updatedAt = "updated_at"
    case profileImageURLs = "profile_image"
  }
}

extension UnsplashUser {
  
  public struct URLs: Codable {
    
    public var small: URL
    public var medium: URL
    public var large: URL
  }
}
