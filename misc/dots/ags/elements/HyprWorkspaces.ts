const hypr = await Service.import("hyprland");

export default () => {
    const activeId = hypr.active.workspace.bind("id");
    const workspaces = hypr.bind("workspaces").as((ws) =>
        ws.map(({ id }) =>
            Widget.Button({
                on_clicked: () => hypr.messageAsync(`dispatch workspace ${id}`),
                child: Widget.Label(`${id}`),
                class_name: activeId.as((i) => `${i === id ? "focused" : ""}`),
            }),
        ),
    );

    return Widget.Box({
        class_name: "workspaces",
        children: workspaces,
    });
};