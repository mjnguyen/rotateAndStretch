//
//  ViewController.swift
//  rotationAndStretch
//
//  Created by Nguyen, Michael on 6/26/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var container: UIView!

    @IBOutlet weak var containerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerWidthConstraint: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func rotateLandscape(_ sender: Any) {
        // rotate the view into landscape and make adjustments as necessary
        let rotation = CGAffineTransformRotate(.identity, .pi / 2.0)

        let yOffset = self.view.frame.size.height / 2.0
        UIView.animate(withDuration: 0.750) {
            self.container.transform = rotation
            self.containerWidthConstraint.constant = 700
        } completion: { _ in
            UIView.animate(withDuration: 0.250) {
                self.container.center = CGPoint(x: 64, y: yOffset)
            }

        }

    }

    @IBAction func turnPortrait(_ sender: Any) {

        let rotation = CGAffineTransformRotate(self.container.transform, -.pi/2.0)
        UIView.animate(withDuration: 0.750) {
            self.container.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height - self.view.safeAreaInsets.bottom - 64 )
        } completion: { _ in
            UIView.animate(withDuration: 0.250) {
                self.container.transform = rotation
                self.containerWidthConstraint.constant = 363
            }

        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "FOOBAR")
        if indexPath.row % 2 == 0 {
            cell.textLabel?.text = "CELL 1"
        }
        else {
            cell.textLabel?.text = "CELL 2"

        }
        cell.sizeToFit()

        return cell
    }
}
