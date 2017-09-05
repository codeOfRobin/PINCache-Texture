//
//  ImageCacheHandler.swift
//  kayako-messenger-SDK
//
//  Created by Robin Malhotra on 29/05/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import PINRemoteImage
import PINCache
import AsyncDisplayKit

enum ImageViewModel {
	case image(UIImage)
	case url(URL)
}

class ImageCacheHandler {

	static let shared = ImageCacheHandler()
	let cache = PINCache(name: "kayako-avatar-cache")
	let remoteImageManager = PINRemoteImageManager()
}

extension ASNetworkImageNode {
	func setImageURL(_ url: URL?) {
		guard let url = url else {
			self.placeholderEnabled = true
			return
		}
		
		PINRemoteImageManager.shared().imageFromCache(with: url, processorKey: nil, options: []) { [weak self] (result) in
			if let image = result.image {
				self?.image = image
			} else {
				PINRemoteImageManager.shared().downloadImage(with: url, options: []) { (result) in
					self?.image = result.image
				}
			}
		}
	}
	
	func setImage(viewModel: ImageViewModel) {
		switch viewModel {
		case .image(let image):
			self.image = image
		case .url(let url):
			self.setImageURL(url)
		}
	}
}
