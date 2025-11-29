def hellwa(p: str = "world"):
    """hello.

    it could be called from coucou function.

    :param p:
    :type p: str
    """
    print(f"hello {p}")


def coucou(p: str = "world"):
    """coucou.

    :param p:
    :type p: str
    """
    e = R"test{p}w+(test)"
    print(f"coucou {p}")
    hellwa(p=p)
