//
//  ImageCacheHandler.swift
//  kayako-messenger-SDK
//
//  Created by Robin Malhotra on 29/05/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import PINCache
import AsyncDisplayKit

public enum ImageViewModel {
	case image(UIImage)
	case url(URL)
}

class ImageCacheHandler {
	static var isLoggingEnabled: Bool = false
}

public extension ASNetworkImageNode {
	func setImageURL(_ url: URL?) {
		guard let url = url else {
			self.placeholderEnabled = true
			return
		}
		
		if ImageCacheHandler.isLoggingEnabled {
			print("🖼 downloading url: \(url)")
		}
		
		PINCache.shared.object(forKeyAsync: url.absoluteString) { (cache, key, object) in
			if let image = object as? UIImage {
				if ImageCacheHandler.isLoggingEnabled {
					print("🖼received image from cache: \(url)")
				}
				self.image = image
			} else {
				URLSession.shared.dataTask(with: url, completionHandler: { (data, _, _) in
					guard let data = data else {
						if ImageCacheHandler.isLoggingEnabled {
							print("🖼 couldn't download imagefrom cache: \(url)")
						}
						return
					}
					
					guard let img = UIImage(data: data, scale:UIScreen.main.scale) else {
						if ImageCacheHandler.isLoggingEnabled {
							print("🖼 couldn't decode image from \(url)")
						}
						return
					}

					PINCache.shared.setObjectAsync(img, forKey: url.absoluteString, completion: nil)
					if ImageCacheHandler.isLoggingEnabled {
						print("🖼 image successfully downloaded from \(url)")
					}
					self.image = img
				}).resume()
			}
		}
	}
}
