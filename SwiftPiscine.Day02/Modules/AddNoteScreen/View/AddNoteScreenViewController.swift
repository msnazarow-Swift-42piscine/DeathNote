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

    lazy var descriptionTextView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height * 0.25))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.layer.borderWidth = 1
        textView.font = .systemFont(ofSize: 20 * verticalTranslation)
        textView.backgroundColor = .clear
        textView.isScrollEnabled = false
        return textView
    }()

    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.minimumDate = Date()
        return datePicker
    }()

    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var footerConstraint: NSLayoutConstraint!

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        subscribeKeyboardNotifications()
    }

    private func setupUI() {
        title = "Add a Person"
        view.backgroundColor = UIColor(patternImage: UIImage.paper.resizedImage(newHeight: view.frame.height)!)
        view.overrideUserInterfaceStyle = .light
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.backgroundColor = .black
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(descriptionTextView)
        scrollView.addSubview(datePicker)
    }

    private func setupConstraints() {
        footerConstraint = scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            footerConstraint,

            nameTextField.widthAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.widthAnchor),
            nameTextField.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 40 * verticalTranslation),
            nameTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            datePicker.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            datePicker.heightAnchor.constraint(equalToConstant: 120 * verticalTranslation),
            datePicker.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            descriptionTextView.widthAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.widthAnchor),
            descriptionTextView.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            descriptionTextView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            descriptionTextView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }

    @objc private func doneButtonTapped() {
        presenter?.savePersonDeath(name: nameTextField.text, date: datePicker.date, description: descriptionTextView.text)
    }
}

extension AddNoteScreenViewController: PresenterToViewAddNoteScreenProtocol {
    func showAlert() {
        let alert = UIAlertController(title: "Warning", message: "The human cannot die if you don't know his name", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

extension AddNoteScreenViewController {
    private func subscribeKeyboardNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            footerConstraint.constant = -keyboardSize.height
        }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        footerConstraint.constant = 0
    }
}
