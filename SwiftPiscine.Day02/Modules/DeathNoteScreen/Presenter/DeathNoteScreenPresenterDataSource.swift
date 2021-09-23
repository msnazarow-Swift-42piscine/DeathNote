//
//  DeathNoteScreenPresenterDataSource.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//

import UIKit

class DeathNoteScreenPresenterDataSource: NSObject, DataSourceDeathNoteScreenProtocol {
    private var sections: [PersonSectionModel] = [PersonSectionModel([
        PersonModel(name: "Donald Prump",
                    date: DateFormatter.ddmmmmyyyy.date(from: "25 June 2016 14:23:43")!,
                    description: "Danced until death."),
        PersonModel(name: "Joffrey Baratheon",
                    date: DateFormatter.ddmmmmyyyy.date(from: "5 May 2016 14:24:43")!,
                    description: "Got poisoned."),
        PersonModel(name: "Ben Solo",
                    date: DateFormatter.ddmmmmyyyy.date(from: "12 July 2016 05:29:18")!,
                    description: "Killed by Snoke."),
    ])]

    func numberOfSections(in _: UITableView) -> Int {
        sections.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count * 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 1 {
            return tableView.dequeueReusableCell(withIdentifier: ClearCell.identifier, for: indexPath)
        }
        let model = sections[indexPath.section].rows[indexPath.row / 2]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        cell.model = model
        return cell
    }

    func pushNewPerson(_ person: PersonModel) {
        sections.first?.rows.append(PersonCellModel(person))
    }
}
