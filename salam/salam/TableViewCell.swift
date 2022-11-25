import UIKit


protocol IAloha : AnyObject{
    func salam()
}

class TableViewCell: UITableViewCell {
    
    weak var delegate : IAloha?
    
    public let personName : UILabel = {
        let label = UILabel()
        label.text = "Sergey Schankin"
        label.textAlignment = .center
        return label
    }()
    
    private let recipeName : UILabel = {
        let label = UILabel()
        label.text = "What mushrooms do they put into supec? It should stay mystery."
        label.contentMode = .scaleToFill
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    private let mainView : UIView = {
        let mainView = UIView()
        
        return mainView
    }()
    
    private let containerView : UIView = {
        let contView = UIView()
        
        return contView
    }()
    
    public let personImg : UIImageView = {
        
        let personUIIMg = UIImage(named: "person")
        let imgPerson = UIImageView(image: personUIIMg)
        
        imgPerson.contentMode = .scaleToFill
        imgPerson.layer.borderWidth = 1
        imgPerson.layer.masksToBounds = false
        imgPerson.layer.borderColor = UIColor.clear.cgColor
        imgPerson.layer.cornerRadius = imgPerson.frame.height/2
        imgPerson.clipsToBounds = true
        
        return imgPerson
    }()
    
    private let postImgContainer : UIView = {
        let contView = UIView()
        
        return contView
    }()
    
    public let PostImg : UIImageView = {
        
        let postImg = UIImage(named: "postImg")
        let imgPost = UIImageView(image: postImg)
        
        imgPost.contentMode = .scaleAspectFill
        
        return imgPost
    }()
    
    public let addFavBtn : UIButton = {
        let uiBtn = UIButton()
        let UIImgAdd = UIImage(named: "addFavBtn")
        let UiImgAddView = UIImageView(image: UIImgAdd)

        UiImgAddView.backgroundColor = .white
        UiImgAddView.contentMode = .center
        UiImgAddView.layer.borderWidth = 1
        UiImgAddView.layer.masksToBounds = false
        UiImgAddView.layer.borderColor = UIColor.clear.cgColor
        UiImgAddView.layer.cornerRadius = 34
        UiImgAddView.clipsToBounds = true
        UiImgAddView.frame = CGRect(x: 0, y: 0, width: 68, height: 68)

        uiBtn.addSubview(UiImgAddView)
        
        return uiBtn
        
    }()
    
    public let postInfoView : UIView = {
        let postInfView = UIView()
        
        let saveCounts = UILabel()
        let datePost = UILabel()
        
        let bottomLine = UIView()
        
        saveCounts.text = "Saved: 32 000"
        datePost.text = "09.11.2022"
        
        datePost.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        saveCounts.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        datePost.textAlignment = .right
        
        postInfView.addSubview(saveCounts)
        postInfView.addSubview(datePost)
        postInfView.addSubview(bottomLine)
        
        saveCounts.translatesAutoresizingMaskIntoConstraints = false
        datePost.translatesAutoresizingMaskIntoConstraints = false
        
        saveCounts.topAnchor.constraint(equalTo: postInfView.topAnchor, constant: 0).isActive = true
        saveCounts.leftAnchor.constraint(equalTo: postInfView.leftAnchor, constant: 0).isActive = true
        saveCounts.widthAnchor.constraint(equalTo: postInfView.widthAnchor, multiplier: 1/2).isActive = true
        datePost.widthAnchor.constraint(equalTo: postInfView.widthAnchor, multiplier: 1/2).isActive = true
        datePost.rightAnchor.constraint(equalTo: postInfView.rightAnchor, constant: 0).isActive = true
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.leftAnchor.constraint(equalTo: postInfView.leftAnchor, constant: 0).isActive = true
        bottomLine.rightAnchor.constraint(equalTo: postInfView.rightAnchor, constant: 0).isActive = true
        bottomLine.topAnchor.constraint(equalTo: saveCounts.bottomAnchor, constant: 5).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomLine.backgroundColor = UIColor.lightGray
        
        return postInfView
        
        
    }()
    
    public let postText : UITextView = {
        let postText = UITextView()
        
        postText.textContainer.maximumNumberOfLines = 6
        postText.textContainer.lineBreakMode = .byTruncatingTail
        postText.text = ""
        
        return postText
        
    }()
    
    @objc func alo(){
        delegate?.salam()
    }
    

    init (delegate: IAloha?, style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        self.delegate = delegate

        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(containerView)
        
        containerView.addSubview(mainView)
        containerView.addSubview(personImg)
        postImgContainer.addSubview(PostImg)

        mainView.addSubview(personName)
        mainView.addSubview(recipeName)
        mainView.addSubview(postImgContainer)
        mainView.addSubview(addFavBtn)
        mainView.addSubview(postInfoView)
        mainView.addSubview(postText)
        
        containerViewSetup()
        mainViewSetup()
        
        personImgSetup()
        personNameSetup()
        recipeNameSetup()
        postImgContainerSetup()
        addFavBtnSetup()
        postInfoViewSetup()
        postTextSetup()
        
    }
    
    func recipeNameSetup(){
        recipeName.translatesAutoresizingMaskIntoConstraints = false
        recipeName.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 10).isActive = true
        recipeName.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -10).isActive = true
        recipeName.topAnchor.constraint(equalTo: personName.bottomAnchor, constant: 15).isActive = true
    }
    
    func containerViewSetup(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 10
    }
    
    func mainViewSetup(){
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        mainView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        mainView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive = true
        mainView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        mainView.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -50).isActive = true
        
        mainView.backgroundColor = .white
        mainView.layer.borderColor = UIColor.clear.cgColor
        mainView.layer.cornerRadius = 7
        mainView.layer.borderWidth = 1
        mainView.layer.masksToBounds = false
        mainView.layer.borderColor = UIColor.clear.cgColor
        mainView.clipsToBounds = true
    }
    
    func postImgContainerSetup(){
        postImgContainer.translatesAutoresizingMaskIntoConstraints = false
        postImgContainer.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 10).isActive = true
        postImgContainer.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -10).isActive = true
        postImgContainer.topAnchor.constraint(equalTo: recipeName.bottomAnchor, constant: 10).isActive = true
        postImgContainer.heightAnchor.constraint(equalToConstant: 250).isActive = true
        postImgContainer.layer.masksToBounds = false
        postImgContainer.clipsToBounds = true
    }
    
    func personImgSetup(){
        personImg.translatesAutoresizingMaskIntoConstraints = false
        personImg.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        personImg.widthAnchor.constraint(equalToConstant: 50).isActive = true
        personImg.bottomAnchor.constraint(equalTo: mainView.topAnchor, constant: 25).isActive = true
    }
    
    func addFavBtnSetup(){
        addFavBtn.translatesAutoresizingMaskIntoConstraints = false
        addFavBtn.topAnchor.constraint(equalTo: postImgContainer.bottomAnchor, constant: -30).isActive = true
        addFavBtn.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 0).isActive = true
        addFavBtn.heightAnchor.constraint(equalToConstant: 68).isActive = true
        addFavBtn.widthAnchor.constraint(equalToConstant: 68).isActive = true
        addFavBtn.addTarget(self, action: #selector(alo), for: .touchUpInside)
    }
    
    func postInfoViewSetup(){
        postInfoView.translatesAutoresizingMaskIntoConstraints = false
        postInfoView.topAnchor.constraint(equalTo: addFavBtn.bottomAnchor, constant: -10).isActive = true
        postInfoView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 10).isActive = true
        postInfoView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -10).isActive = true
    }
    
    func postTextSetup(){
        postText.translatesAutoresizingMaskIntoConstraints = false
        postText.topAnchor.constraint(equalTo: postInfoView.bottomAnchor, constant: 30).isActive = true
        postText.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 10).isActive = true
        postText.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -10).isActive = true
        postText.heightAnchor.constraint(lessThanOrEqualToConstant: 95).isActive = true
    }
    
    func personNameSetup(){
        personName.translatesAutoresizingMaskIntoConstraints = false
        personName.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20).isActive = true
        personName.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20).isActive = true
        personName.topAnchor.constraint(equalTo: personImg.bottomAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    


}
