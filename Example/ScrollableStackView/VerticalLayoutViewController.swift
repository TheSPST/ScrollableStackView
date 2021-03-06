// MIT license. Copyright (c) 2017 Gürhan Yerlikaya. All rights reserved.
import UIKit
import ScrollableStackView

class VerticalLayoutViewController: UIViewController {
	@IBOutlet weak var scrollable: ScrollableStackView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		scrollable.stackView.distribution = .fillProportionally
		scrollable.stackView.alignment = .center
		scrollable.scrollView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)

        for _ in 1 ..< 23 {
            let min:UInt32 = 30
            let max:UInt32 = UInt32(view.bounds.width - 10)
            let random = CGFloat(arc4random_uniform(max - min) + min) // between 30-130
            let rectangle = UIView(frame: CGRect(x: 0, y: 0, width: random, height: random))
            rectangle.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
            rectangle.heightAnchor.constraint(equalToConstant: random).isActive = true
            rectangle.widthAnchor.constraint(equalToConstant: random).isActive = true
            scrollable.stackView.addArrangedSubview(rectangle)
        }
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 45))
        label.numberOfLines = 0
        label.text = "Here's to the crazy ones. The misfits. The rebels. The troublemakers. The round pegs in the square holes. The ones who see things differently. They're not fond of rules. And they have no respect for the status quo. You can quote them, disagree with them, glorify or vilify them. About the only thing you can't do is ignore them. Because they change things. They push the human race forward. And while some may see them as the crazy ones, we see genius. Because the people who are crazy enough to think they can change the world, are the ones who do."
        
        label.sizeToFit()
        scrollable.stackView.addArrangedSubview(label)
    }
	
	@IBAction func jumpToViewAction(_ sender: Any) {
		scrollable.scrollToItem(index: 11)
	}
}
