//
//  PagingTabBarCollectionViewCell.swift
//  CustomTabbar
//
//  Created by siyeon park on 2023/12/15.
//

import UIKit
import SnapKit

final class PagingTabBarCell: UICollectionViewCell, ReuseIdentifying {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .semibold)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()

    private lazy var underLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.alpha = 0.0
        return view
    }()

    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .systemPink : .secondaryLabel
            underLine.alpha = isSelected ? 1.0 : 0.0
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(title: String) {
        titleLabel.text = title
    }
}

extension PagingTabBarCell {
    func setupUI() {
        [titleLabel, underLine].forEach { addSubview($0) }

        setupConstraints()
    }

    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }

        underLine.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.height.equalTo(3)
        }
    }
}
