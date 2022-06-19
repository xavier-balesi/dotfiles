#!/use/bin/python


from typing import Optional


class Abstract:
    pass


class MainClass(Abstract):
    """Description"""

    def __init__(self, name: str) -> None:
        self.name = name
        super().__init__()

    def get_name(self) -> str:
        """Get the name

        :return: the name
        """
        return self.name

    def set_name(self, name) -> None:
        """set the name

        :name: name to set
        """

        if len(name) > 1:
            self.name = name
        else:
            raise ValueError(f"name too short {name}")


def decoco(func):
    def wrapper(*args, **kwargs):
        print("test")
        return func(*args, **kwargs)

    return wrapper


@decoco
def main_creator(name: str, non_used: Optional[int] = None) -> MainClass:
    print(non_used)
    return MainClass(name)


# début du prog

if __name__ == "__main__":

    a = main_creator("salut")
    print(a.get_name())
    a.set_name("jojo")
