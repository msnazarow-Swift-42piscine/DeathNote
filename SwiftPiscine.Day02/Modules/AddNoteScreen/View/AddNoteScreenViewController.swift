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

    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 30 * verticalTranslation)
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Name"
        return textField
    }()

    lazy var descriptionTextField: UITextView = {
        let textField = UITextView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height * 0.25))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.font = .systemFont(ofSize: 20 * verticalTranslation)
        textField.backgroundColor = .clear
        return textField
    }()

    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.minimumDate = Date()
        return datePicker
    }()

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "Add a Person"
        view.backgroundColor = UIColor(patternImage: .paper.resizedImage(newHeight: view.frame.height)!)
        view.overrideUserInterfaceStyle = .light
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.backgroundColor = .black
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        view.addSubview(nameTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(datePicker)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            descriptionTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            datePicker.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 40 * verticalTranslation),
            datePicker.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            datePicker.heightAnchor.constraint(equalToConstant: 100 * verticalTranslation),
            descriptionTextField.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            descriptionTextField.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25),
        ])
    }

    @objc private func doneButtonTapped() {
        presenter?.savePersonDeath(name: nameTextField.text, date: datePicker.date, description: descriptionTextField.text)
    }
}

extension AddNoteScreenViewController: PresenterToViewAddNoteScreenProtocol {
    func showAlert() {
        let alert = UIAlertController(title: "Warning", message: "The human cannot die if you don't know his name", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
