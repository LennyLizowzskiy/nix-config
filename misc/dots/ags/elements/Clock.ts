const date = Variable("", {
    poll: [2000, `date "+%a %m/%d, %H:%M"`],
});

export default () => {
    return Widget.Label({
        class_name: "clock",
        label: date.bind(),
    });
};