//
//  MenuDetailPresenter.swift
//  
//
//  Created by Suguru Takahashi on 2023/04/28.
//

import Foundation
import SampleAppDomain

// MenuPresenterとは違い、initでRepositoryを指定するのではなく、以下のようにパラメーターを指定してあげる方法もある
//   -> この方法だと dynamic dispatch ではなく、static dispatch となるので、ビルドが処理が早い
//     -> Ref: https://www.youtube.com/watch?v=HygLwTRO-Zw
//   -> また、この方法だと Repository の処理は static func で定義することも可能であるが、Mockのように外から値を自由に変えれるようにできなくなってしまう（固定値を返すスタブなら可能）
//   -> この方法の欠点としてinitの引数で渡すときに可能であったView側でのRepositoryの隠蔽はできなくなるが、
//      SwiftUIのPreviewsでモックを使うと結局Repositoryの具体を知るようなコードになってしまうので、そもそも欠点でもなかったかもしれません
@MainActor
class MenuDetailPresenter<Repository: MenuDetailRepositoryProtocol>: ObservableObject {
    private let repository: Repository
    private let menu: SampleAppDomain.Menu
    @Published private(set) var menuDetail: String = ""

    init(menu: SampleAppDomain.Menu, repository: Repository) {
        self.menu = menu
        self.repository = repository
    }

    func onAppear() async {
        do {
            menuDetail = try await repository.fetch(menu: menu)
        } catch {
            print(error)
        }
    }
}
