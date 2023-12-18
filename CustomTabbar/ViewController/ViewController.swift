//
//  ViewController.swift
//  CustomTabbar
//
//  Created by siyeon park on 2023/12/15.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    private let categoryTitleList = ["추천", "신상품", "베스트", "알뜰쇼핑", "특가/혜택"]

    private lazy var pagingTabBar = PagingTabBar(categoryTitleList: categoryTitleList)
    private lazy var pagingView = PagingView(categoryTitleList: categoryTitleList, pagingTabBar: pagingTabBar)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
}

extension ViewController {
    func setupUI() {
        [pagingTabBar, pagingView].forEach { view.addSubview($0) }
    }

    func setupConstraints() {
        pagingTabBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(pagingTabBar.cellHeight)
        }

        pagingView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(pagingTabBar.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
