//
//  AddNoteScreenViewController.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//  
//

import UIKit

class AddNoteScreenViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterAddNoteScreenProtocol?

//    lazy var backgroundImage = #imageLiteral(resourceName: "OldPaper").resizedImage(newHeight: view.bounds.height)

    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 30)
        textField.textAlignment = .center
        textField.placeholder = "Name"
        return textField
    }()

    let descriptionTextField: UITextView = {
        let textField = UITextView()
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.backgroundColor = .clear
        return textField
    }()

    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minimumDate = Date()
        return datePicker
    }()
    lazy var vstack: UIStackView = {
        let vstack = UIStackView(arrangedSubviews: [nameTextField, datePicker, descriptionTextField])
        vstack.axis = .vertical
        vstack.distribution = .fillEqually
        vstack.alignment = .fill
        vstack.translatesAutoresizingMaskIntoConstraints = false
        return vstack
    }()
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
//        DispatchQueue.global().async {
//            if let image = self.backgroundImage {
//                DispatchQueue.main.async {
//                    self.view.backgroundColor = UIColor(patternImage: image).withAlphaComponent(0.5)
//                }
//            }
//        }

        title = "Add a Person"
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "OldPaper").resizedImage(newHeight: view.frame.height)!)
//        view.backgroundColor
        view.overrideUserInterfaceStyle = .light
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.backgroundColor = .black
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        view.addSubview(vstack)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            vstack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            vstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vstack.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,multiplier: 0.7)
        ])


    }


    @objc private func doneButtonTapped() {
        presenter?.savePersonDeath(name: nameTextField.text, date: datePicker.date, description: descriptionTextField.text)
    }
    
}

extension AddNoteScreenViewController: PresenterToViewAddNoteScreenProtocol{
    // TODO: Implement View Output Methods
    func showAlert(){
        let alert = UIAlertController(title: "Warning", message: "The human cannot die if you don't know his name", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
