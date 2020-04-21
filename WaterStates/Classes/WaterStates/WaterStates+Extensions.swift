import UIKit

public extension WaterStates where Self: UIViewController {

    private var waterStatesDelegate: WaterStatesDelegate? {
        return (self as? WaterStatesDelegate) ?? getModuleInput(for: "output") as? WaterStatesDelegate
    }

    func defaultShowError(_ info: StateInfo) {
        if errorView == nil { errorView = WaterStatesConfig.errorView.copyView() }
        guard let errorView = self.errorView else { return }
        if errorView.delegate == nil {
            errorView.delegate = waterStatesDelegate
        }
        errorView.type = .error
        errorView.configure(with: info.title, description: info.description)
        errorView.show(in: view)
    }

    func defaulthideError() {
        errorView?.hide()
    }

    func defaultShowLoading(_ info: StateInfo) {
        if loadingView == nil { loadingView = WaterStatesConfig.loadingView.copyView() }
        guard let loadingView = self.loadingView else { return }
        loadingView.type = .loading
        loadingView.configure(with: info.title, description: info.description)
        loadingView.show(in: view)
    }

    func defaultHideLoading() {
        loadingView?.hide()
    }

    func defaultShowEmpty(_ info: StateInfo) {
        if emptyView == nil { emptyView = WaterStatesConfig.emptyView.copyView() }
        guard let emptyView = self.emptyView else { return }
        if emptyView.delegate == nil {
            emptyView.delegate = waterStatesDelegate
        }
        emptyView.type = .empty
        emptyView.configure(with: info.title, description: info.description)
        emptyView.show(in: view)
    }

    func defaultHideEmpty() {
        emptyView?.hide()
    }
}
