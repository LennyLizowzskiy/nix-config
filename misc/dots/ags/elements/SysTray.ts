const systray = await Service.import("systemtray");

export default () => {
    const items = systray.bind("items").as((items) =>
        items.map((item) =>
            Widget.Button({
                class_name: "systray:item",
                child:
                    Widget.Icon({ icon: item.bind("icon") }),
                on_primary_click:
                    (_, event) => item.activate(event),
                on_secondary_click:
                    (_, event) => item.openMenu(event),
                tooltip_markup:
                    item.bind("tooltip_markup"),
            }),
        ),
    );

    return Widget.Box({
        class_name: "systray:box",
        children: items,
        css: "padding: 4px 4px 4px 4px;",
    });
};