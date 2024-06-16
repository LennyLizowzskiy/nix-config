const lang = Variable("", {
    // TODO:
    // poll: [1000, `bash -c "hyprctl devices -j | "`],
});
export default () => {
    return Widget.Box({
        class_name: "kblang",
        children: [
            Widget.Label({
                label: lang.bind(),
            }),
        ],
    });
};