
import Foundation

public struct UnsplashPhoto: Codable {
  
  public typealias ID = Tagged<UnsplashPhoto, String>
  
  public struct URLs: Codable {
    
    public var raw: URL
    public var full: URL
    public var regular: URL
    public var small: URL
    public var thumb: URL
  }
  
  public var id: ID
  public var createdAt: Date
  public var updatedAt: Date
  public var width: Int
  public var height: Int
  public var colorHEX: String
  public var likes: Int
  public var description: String?
  public var urls: URLs

  private enum CodingKeys: String, CodingKey {
    
    case id, width, height, likes, description, urls
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case colorHEX = "color"
  }
}
