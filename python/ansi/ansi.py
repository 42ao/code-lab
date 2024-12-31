# https://en.wikipedia.org/wiki/ANSI_escape_code

from enum import Enum

ESC = "\033"  # Escape
CSI = f"{ESC}["  # Control Sequence Introducer


class ANSI(Enum):
    RESET = f"{CSI}0m"
    # Formatting
    BOLD = f"{CSI}1m"
    DIM = f"{CSI}2m"
    ITALIC = f"{CSI}3m"
    UNDERLINE = f"{CSI}4m"
    BLINK = f"{CSI}5m"
    INVERT = f"{CSI}7m"
    HIDDEN = f"{CSI}8m"
    # Regular colors
    BLACK = f"{CSI}30m"
    RED = f"{CSI}31m"
    GREEN = f"{CSI}32m"
    YELLOW = f"{CSI}33m"
    BLUE = f"{CSI}34m"
    MAGENTA = f"{CSI}35m"
    CYAN = f"{CSI}36m"
    WHITE = f"{CSI}37m"
    GRAY = f"{CSI}90m"
    # Bright colors
    BRIGHT_BLACK = f"{CSI}90m"
    BRIGHT_RED = f"{CSI}91m"
    BRIGHT_GREEN = f"{CSI}92m"
    BRIGHT_YELLOW = f"{CSI}93m"
    BRIGHT_BLUE = f"{CSI}94m"
    BRIGHT_MAGENTA = f"{CSI}95m"
    BRIGHT_CYAN = f"{CSI}96m"
    BRIGHT_WHITE = f"{CSI}97m"


def to_ansi(name: str | ANSI) -> ANSI:
    if isinstance(name, ANSI):
        return name
    try:
        ansi = ANSI[name]
    except KeyError:
        raise ValueError(f"Invalid ANSI value {name}")
    return ansi
