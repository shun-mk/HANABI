# ClosureUtil
### Overview  
UIKitのDelegateやDataSoruce  
GesutreRecognizerをClosureで宣言できるようにしたUtilityです

## Example
### add Tap Action for UIButton
#### Before
```
@IBAction func onTap(_ sender: Any) {
    print("Hello World")
}
```
#### After
```
@IBOutlet weak var button: UIButton! {
    didSet {
        GestureRecognizerUtil.addTapGestureRecognizer(to: button, target: self) { gesture in
            print("Hello World")
        }
    }
}
```

### Set DataSource for UITableView
#### Before
```
final class viewController: UIViewController, UITableViewDataSoruce {
    let items = ["1", "2", "3"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.dataSoruce = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = items[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = title
        return cell
    }
}
```

#### After
```
final class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.setClosureToDataSource(
                numberOfRowsInSection: { [weak self] (tableView, section) -> Int in
                    guard let `self` = self else { return 0 }
                    return self.items.count
            }, cellForRowAtIndexPath: { [weak self] (tableView, indexPath) -> UITableViewCell in
                guard let `self` = self else { return UITableViewCell() }
                let title = self.items[indexPath.row]
                let cell = UITableViewCell()
                cell.textLabel?.text = title
                return cell
            })
        }
    }
 }
```


**Special Thanks  
Sougo Kobayashi**
