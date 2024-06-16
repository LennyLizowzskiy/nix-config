const battery = await Service.import("battery");

const padding = "8px";

export default () => {
    const value = battery.bind("percent")
        .as((p) => (p > 0 ? p / 100 : 0))
        .as((p) => `󰂄 ${p}%`);

    return Widget.Box({
        class_name: "battery",
        css: `padding-right: ${padding}; padding-left: ${padding};`,
        children: [
            Widget.Label({
                label: value
            }),
        ],
    });
};