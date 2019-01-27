//
// CollectionListViewController+Props.swift
// Created by Dima Vorona
//

import Foundation
import UIKit
import Store

extension CollectionListViewController {
  
  public struct Props {
    
    public struct Collection {

      var title: String
      var totalPhotos: Int
      
      var tags: [Tag]
      var user: User
      
      var cover: Photo
      var previews: [Photo]
    }
    
    public struct Photo {
      
      var image: UIImage?
      var load: Command<CGSize>?
    }
    
    public struct User {
      
      var name: String
    }
    
    public struct Tag {
      
      var title: String
    }
  }
}
