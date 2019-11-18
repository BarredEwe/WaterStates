public extension LoadingDisplayable {
    func showLoading(_ info: StateInfo) {}
    func hideLoading() {}
}

public extension ContentDispayable {
    func showContent(_: ContentType) {}
    func hideContent() {}
}

public extension EmptyDisplayable {
    func showEmpty(_ info: StateInfo) { }
    func hideEmpty() {}
}

public extension ErrorDispayable {
    func showError(_ info: StateInfo) { }
    func hideError() {}
}
