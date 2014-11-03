//
//  View.swift
//  Oct 30
//
//  Created by Elena Da Re on 11/2/14.
//  Copyright (c) 2014 Elena Da Re. All rights reserved.
//

import UIKit

class View: UIView {
	
	var i: CGFloat = 1;
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		//Ask for a color that is not the default.
		//Must do it here: in drawRect would be too late.
		backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.2, alpha: 0.6);
		
	}
	
	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	
	override func drawRect(rect: CGRect) {
		// Drawing code
		let s: String = "Oct 30";
		let font: UIFont = UIFont.systemFontOfSize(i);
		let foregroundColor: UIColor = UIColor.whiteColor();
		let attributes: [NSObject: AnyObject] = [ NSFontAttributeName: font, NSForegroundColorAttributeName: foregroundColor];
		
		let size: CGSize = s.sizeWithAttributes(attributes);
		let x: CGFloat = bounds.origin.x + (bounds.size.width - size.width) / 2;
		let y: CGFloat = bounds.origin.y + (bounds.size.height - size.height) / 2;
		let point: CGPoint = CGPointMake(x, y);
		
		s.drawAtPoint(point, withAttributes: attributes);
		
		if i < (bounds.size.width - size.width) / 2 {
			++i;
		} else {
			i = 1;
		}
		
		
		//Call drawRect(_:) 30 times per second.
		let t: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)/30);
		dispatch_after(t, dispatch_get_main_queue(), {self.setNeedsDisplay();});
		
	}
	
	
}