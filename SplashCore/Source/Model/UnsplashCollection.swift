
import Foundation

public struct UnsplashCollection: Codable {

  public typealias ID = Tagged<UnsplashCollection, Int>
  
  public var id: ID
  public var title: String
  public var description: String?
  public var publishedAt: Date
  public var updatedAt: Date
  public var curated: Bool
  public var featured: Bool
  public var totalPhotos: Int

  public var coverPhoto: UnsplashPhoto
  public var categories: [UnsplashCategory]?
  public var user: UnsplashUser

  private enum CodingKeys: String, CodingKey {
    
    case id, title, description, curated, featured, categories, user
    case publishedAt = "published_at"
    case updatedAt = "updated_at"
    case totalPhotos = "total_photos"
    case coverPhoto = "cover_photo"
  }
}
