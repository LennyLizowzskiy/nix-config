import Clock from "elements/Clock";
import HyprWorkspaces from "elements/HyprWorkspaces";
import Volume from "elements/Volume";
import Notifications from "elements/Notifications";
import Battery from "elements/Battery";
import HyprKbLanguage from "elements/HyprKeyboardLanguage";
import SysTray from "elements/SysTray";

namespace Layout {
    const spacing = 8;

	export const Left = () => {
		return Widget.Box({
			spacing: spacing,
			children: [
				HyprWorkspaces(),
			],
		});
	};

	export const Center = () => {
		return Widget.Box({
			spacing: spacing,
			children: [
				Clock(),
			],
		});
	};

	export const Right = () => {
		return Widget.Box({
			spacing: spacing,
			hpack: "end",
			children: [
				SysTray(),
				Notifications(),
				Volume(),
				// HyprKbLanguage(),
				Battery(),
			],
		});
	};
}

export default (monitor: number) => {
	return Widget.Window({
		name: `bar-${monitor}`,
		class_name: "bar",
		css: "height: 32px",
		monitor,
		anchor: ["top", "left", "right"],
		exclusivity: "exclusive",
		child: Widget.CenterBox({
			start_widget: Layout.Left(),
			center_widget: Layout.Center(),
			end_widget: Layout.Right(),
		}),
	});
};