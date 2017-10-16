//
//  ViewController.swift
//  Example
//
//  Created by Robin Malhotra on 16/10/17.
//  Copyright © 2017 PINCacheTexture. All rights reserved.
//

import AsyncDisplayKit
import PINCacheTexture

class ViewController: UIViewController {
	
	let node1 = ASNetworkImageNode()
	let node2 = ASNetworkImageNode()
	let node3 = ASNetworkImageNode()


	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubnode(node1)
		view.addSubnode(node2)
		view.addSubnode(node3)
		
		
		node1.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		node1.setImageURL(URL.init(string: "https://kayako-mobile-testing.kayako.com/avatar/get/2c15cff7-c76e-5362-b39e-2d22d0c70b00?1508142242"))
		
		node2.frame = CGRect(x: 100, y: 0, width: 100, height: 100)
		node2.setImageURL(URL.init(string: "https://kayako-mobile-testing.kayako.com/avatar/get/22e238af-5bcd-5159-a4ac-e7f016821151?1508139874"))
		
		node3.frame = CGRect(x: 200, y: 0, width: 100, height: 100)
		node3.setImageURL(URL.init(string: "https://kayako-mobile-testing.kayako.com/avatar/get/1e4dd52f-6383-5e07-aed0-864c06d6b232?1508135367"))
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

