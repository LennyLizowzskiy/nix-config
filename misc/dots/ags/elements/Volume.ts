const audio = await Service.import("audio");

type State = {
    name: string,
    min_threshold: number,
    icon: string,
}

const states: State[] = [
    {
        name: "overamplified",
        min_threshold: 101,
        icon: "󱄠",
    },
    {
        name: "high",
        min_threshold: 67,
        icon: "󰕾",
    },
    {
        name: "medium",
        min_threshold: 34,
        icon: "󰖀",
    },
    {
        name: "low",
        min_threshold: 1,
        icon: "󰕿",
    },
    {
        name: "muted",
        min_threshold: 0,
        icon: "󰝟",
    }
];

export default () => {
    return Widget.Box({
        class_name: "volume",
        children: [
            Widget.Label().hook(audio.speaker, self => {
                const vol = Math.round(audio.speaker.volume * 100)

                let icon = "";
                for (const state of states) {
                    if (vol >= state.min_threshold) {
                        icon = state.icon;
                        break;
                    }
                }

                self.set_text(`${icon} ${vol}%`)
            })
        ],
    });
};