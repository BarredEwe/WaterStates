import UIKit

public extension WaterStates where Self: UIViewController {

    func showState(_ state: State<ContentType>) {
        if stateMachine == nil { stateMachine = StateMachine(displayable: self) }
        stateMachine?.setState(state)
    }

    func showError(_ info: StateInfo) {
        guard info.type == StateInfo.defaultStateType else { return }
        defaultShowError(info)
    }

    func hideError() {
        defaulthideError()
    }

    func showLoading(_ info: StateInfo) {
        guard info.type == StateInfo.defaultStateType else { return }
        defaultShowLoading(info)
    }

    func hideLoading() {
        defaultHideLoading()
    }

    func showEmpty(_ info: StateInfo) {
        guard info.type == StateInfo.defaultStateType else { return }
        defaultShowEmpty(info)
    }

    func hideEmpty() {
        defaultHideEmpty()
    }

    func showContent(_: Any) { }
}
