import os

from format.ansi import ANSI, to_ansi


def format(fmt: ANSI, text: str) -> str:
    """Format text with ANSI escape sequences"""
    return f"{fmt.value}{text}{ANSI.RESET.value}"


def bold(text: str) -> str:
    """Bold text with ANSI escape sequences"""
    return format(ANSI.BOLD, text)


def padded(text: str, char: str = "_", width: int = 80) -> str:
    """Pad text with a character to a specified width"""
    width = int(os.getenv("PADDING_WIDTH", width))
    text += " "
    return text.ljust(width, char)


class Section:
    """
    Section class for formatting section headers on the console.

    The Section class formats section headers using ANSI escape sequences.
    It takes a string argument and returns a formatted string with the section
    name in uppercase and the color specified in the environment variable
    COLOR_SECTION. If the environment variable is not set, it defaults to green.
    """
    __env_key_color: str = "COLOR_SECTION"
    color: ANSI = ANSI.GREEN

    def __init__(self, section: str) -> None:
        self.section = section
        self.color = to_ansi(os.getenv(self.__env_key_color, self.color))

    def __str__(self) -> str:
        return f"\n{bold(format(self.color, padded(self.section.upper())))}"


class Title:
    """
    Title class for formatting titles on the console.

    The Title class formats titles using ANSI escape sequences. It takes a
    string argument and returns a formatted string with the title in the color
    specified in the environment variable COLOR_TITLE. If the environment
    variable is not set, it defaults to bright green.
    """
    __env_key_color: str = "COLOR_TITLE"
    color: ANSI = ANSI.BRIGHT_GREEN

    def __init__(self, title: str) -> None:
        self.title = title
        self.color = to_ansi(os.getenv(self.__env_key_color, self.color))

    def __str__(self) -> str:
        return f"\n{format(self.color, self.title)}"


class Code:
    """
    Code class for formatting code blocks on the console.

    The Code class formats code blocks using ANSI escape sequences. It takes a
    string argument and returns a formatted string with the code in the color
    specified in the environment variable COLOR_CODE. If the environment
    variable is not set, it defaults to gray.
    """
    __env_key_color: str = "COLOR_CODE"
    color: ANSI = ANSI.GRAY

    def __init__(self, code: str) -> None:
        self.code = code
        self.color = to_ansi(os.getenv(self.__env_key_color, self.color))

    def __str__(self) -> str:
        return f"{format(self.color, self.code)}"


class Note:
    """
    Note class for formatting notes on the console.

    The Note class formats notes using ANSI escape sequences. It takes a string
    argument and returns a formatted string with the note in the color specified
    in the environment variable COLOR_NOTE. If the environment variable is not
    set, it defaults to the default color.
    """
    __env_key_color: str = "COLOR_NOTE"
    color: ANSI = ANSI.BRIGHT_YELLOW

    def __init__(self, note: str) -> None:
        self.note = note
        self.color = to_ansi(os.getenv(self.__env_key_color, self.color))

    def __str__(self) -> str:
        return f"{format(self.color, self.note)}"


class BOF:
    """
    BOF (Beginning of File) class for formatting the beginning of a file on the
    console.

    The BOF class formats the beginning of a file using ANSI escape sequences.
    It takes a string argument and returns a formatted string with the file name
    in the color specified in the environment variable COLOR_BOF. If the
    environment variable is not set, it defaults to bright cyan.
    """
    __env_key_color: str = "COLOR_BOF"
    color: ANSI = ANSI.BRIGHT_CYAN

    def __init__(self, file_name: str) -> None:
        self.file_name = file_name
        self.color = to_ansi(os.getenv(self.__env_key_color, self.color))

    def __str__(self) -> str:
        return f"{format(self.color, padded(self.file_name, '`'))}"


class EOF:
    """
    EOF (End of File) class for formatting the end of a file on the console.

    The EOF class formats the end of a file using ANSI escape sequences. It
    takes a string argument and returns a formatted string with the file name in
    the color specified in the environment variable COLOR_EOF. If the
    environment variable is not set, it defaults to bright cyan.
    """
    __env_key_color: str = "COLOR_EOF"
    color: ANSI = ANSI.BRIGHT_CYAN

    def __init__(self, file_name: str) -> None:
        self.file_name = file_name
        self.color = to_ansi(os.getenv(self.__env_key_color, self.color))

    def __str__(self) -> str:
        return f"{format(self.color, padded(self.file_name, '`'))}"


class Source:
    """
    Source class for formatting source code files on the console.

    The Source class formats source code files using ANSI escape sequences. It
    takes a file name as an argument and returns a formatted string with the
    file's content and additional formatting for the title, beginning, and end
    of the file.
    """
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
