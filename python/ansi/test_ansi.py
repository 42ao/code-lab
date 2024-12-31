import pytest
from ansi.ansi import to_ansi, ANSI


def test_to_ansi_returns_ansi_instance_for_ansi_instance():
    assert to_ansi(ANSI.RESET) == ANSI.RESET
    assert to_ansi(ANSI.BOLD) == ANSI.BOLD
    assert to_ansi(ANSI.DIM) == ANSI.DIM
    assert to_ansi(ANSI.ITALIC) == ANSI.ITALIC
    assert to_ansi(ANSI.UNDERLINE) == ANSI.UNDERLINE
    assert to_ansi(ANSI.BLINK) == ANSI.BLINK
    assert to_ansi(ANSI.INVERT) == ANSI.INVERT
    assert to_ansi(ANSI.HIDDEN) == ANSI.HIDDEN
    assert to_ansi(ANSI.BLACK) == ANSI.BLACK
    assert to_ansi(ANSI.RED) == ANSI.RED
    assert to_ansi(ANSI.GREEN) == ANSI.GREEN
    assert to_ansi(ANSI.YELLOW) == ANSI.YELLOW
    assert to_ansi(ANSI.BLUE) == ANSI.BLUE
    assert to_ansi(ANSI.MAGENTA) == ANSI.MAGENTA
    assert to_ansi(ANSI.CYAN) == ANSI.CYAN
    assert to_ansi(ANSI.WHITE) == ANSI.WHITE
    assert to_ansi(ANSI.GRAY) == ANSI.GRAY
    assert to_ansi(ANSI.BRIGHT_BLACK) == ANSI.BRIGHT_BLACK
    assert to_ansi(ANSI.BRIGHT_RED) == ANSI.BRIGHT_RED
    assert to_ansi(ANSI.BRIGHT_GREEN) == ANSI.BRIGHT_GREEN
    assert to_ansi(ANSI.BRIGHT_YELLOW) == ANSI.BRIGHT_YELLOW
    assert to_ansi(ANSI.BRIGHT_BLUE) == ANSI.BRIGHT_BLUE
    assert to_ansi(ANSI.BRIGHT_MAGENTA) == ANSI.BRIGHT_MAGENTA
    assert to_ansi(ANSI.BRIGHT_CYAN) == ANSI.BRIGHT_CYAN
    assert to_ansi(ANSI.BRIGHT_WHITE) == ANSI.BRIGHT_WHITE

def test_to_ansi_returns_ansi_instance_for_valid_ansi_name():
    assert to_ansi("RESET") == ANSI.RESET
    assert to_ansi("BOLD") == ANSI.BOLD
    assert to_ansi("DIM") == ANSI.DIM
    assert to_ansi("ITALIC") == ANSI.ITALIC
    assert to_ansi("UNDERLINE") == ANSI.UNDERLINE
    assert to_ansi("BLINK") == ANSI.BLINK
    assert to_ansi("INVERT") == ANSI.INVERT
    assert to_ansi("HIDDEN") == ANSI.HIDDEN
    assert to_ansi("BLACK") == ANSI.BLACK
    assert to_ansi("RED") == ANSI.RED
    assert to_ansi("GREEN") == ANSI.GREEN
    assert to_ansi("YELLOW") == ANSI.YELLOW
    assert to_ansi("BLUE") == ANSI.BLUE
    assert to_ansi("MAGENTA") == ANSI.MAGENTA
    assert to_ansi("CYAN") == ANSI.CYAN
    assert to_ansi("WHITE") == ANSI.WHITE
    assert to_ansi("GRAY") == ANSI.GRAY
    assert to_ansi("BRIGHT_BLACK") == ANSI.BRIGHT_BLACK
    assert to_ansi("BRIGHT_RED") == ANSI.BRIGHT_RED
    assert to_ansi("BRIGHT_GREEN") == ANSI.BRIGHT_GREEN
    assert to_ansi("BRIGHT_YELLOW") == ANSI.BRIGHT_YELLOW
    assert to_ansi("BRIGHT_BLUE") == ANSI.BRIGHT_BLUE
    assert to_ansi("BRIGHT_MAGENTA") == ANSI.BRIGHT_MAGENTA
    assert to_ansi("BRIGHT_CYAN") == ANSI.BRIGHT_CYAN
    assert to_ansi("BRIGHT_WHITE") == ANSI.BRIGHT_WHITE

def test_to_ansi_raises_value_error_for_invalid_ansi_name():
    with pytest.raises(ValueError) as e:
        to_ansi("INVALID")
    assert str(e.value) == "Invalid ANSI value INVALID"
