import os

from format.ansi import ANSI, to_ansi


def format(fmt: ANSI, text: str) -> str:
    return f"{fmt.value}{text}{ANSI.RESET.value}"


def bold(text: str) -> str:
    return format(ANSI.BOLD, text)


def padded(text: str, char: str = "_", width: int = 80) -> str:
    width = int(os.getenv("PADDING_WIDTH", width))
    text += " "
    return text.ljust(width, char)


class Section:
    __env_key_color: str = "COLOR_SECTION"
    color: ANSI = ANSI.GREEN

    def __init__(self, section: str) -> None:
        self.section = section
        self.color = to_ansi(os.getenv(self.__env_key_color, self.color))

    def __str__(self) -> str:
        return f"\n{bold(format(self.color, padded(self.section.upper())))}"


class Title:
    __env_key_color: str = "COLOR_TITLE"
    color: ANSI = ANSI.BRIGHT_GREEN

    def __init__(self, title: str) -> None:
        self.title = title
        self.color = to_ansi(os.getenv(self.__env_key_color, self.color))

    def __str__(self) -> str:
        return f"\n{format(self.color, self.title)}"


class Code:
    __env_key_color: str = "COLOR_CODE"
    color: ANSI = ANSI.GRAY

    def __init__(self, code: str) -> None:
        self.code = code
        self.color = to_ansi(os.getenv(self.__env_key_color, self.color))

    def __str__(self) -> str:
        return f"{format(self.color, self.code)}"


class Note:
    __env_key_color: str = "COLOR_NOTE"
    color: ANSI = ANSI.BRIGHT_YELLOW

    def __init__(self, note: str) -> None:
        self.note = note
        self.color = to_ansi(os.getenv(self.__env_key_color, self.color))

    def __str__(self) -> str:
        return f"{format(self.color, self.note)}"


class BOF:
    __env_key_color: str = "COLOR_BOF"
    color: ANSI = ANSI.BRIGHT_CYAN

    def __init__(self, file_name: str) -> None:
        self.file_name = file_name
        self.color = to_ansi(os.getenv(self.__env_key_color, self.color))

    def __str__(self) -> str:
        return f"{format(self.color, padded(self.file_name, '`'))}"


class EOF:
    __env_key_color: str = "COLOR_EOF"
    color: ANSI = ANSI.BRIGHT_CYAN

    def __init__(self, file_name: str) -> None:
        self.file_name = file_name
        self.color = to_ansi(os.getenv(self.__env_key_color, self.color))

    def __str__(self) -> str:
        return f"{format(self.color, padded(self.file_name, '`'))}"


class Source:
    def __init__(self, file_name: str) -> None:
        self.file_name = file_name
        if not os.path.exists(self.file_name):
            raise FileNotFoundError(f"No source file {self.file_name} in {os.getcwd()}")
        else:
            self.source = ""
            with open(self.file_name, "r") as file:
                self.source = file.read()

    def __str__(self) -> str:
        return f"""{Title('SOURCE')}
{BOF(self.file_name)}
{Code(self.source)}
{EOF(self.file_name)}"""
