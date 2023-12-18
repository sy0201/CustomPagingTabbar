//
//  PagingCollectionViewCell.swift
//  CustomTabbar
//
//  Created by siyeon park on 2023/12/15.
//

import UIKit
import SnapKit

final class PagingCollectionViewCell: UICollectionViewCell, ReuseIdentifying {

    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36.0, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        label.backgroundColor = [.systemOrange, .systemPurple, .systemCyan, .systemMint, .systemBrown, .systemYellow].randomElement()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(title: String) {
        contentLabel.text = title
    }
}

extension PagingCollectionViewCell {
    func setupUI() {
        [contentLabel].forEach { addSubview($0) }
    }

    func setupConstraints() {
        contentLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
