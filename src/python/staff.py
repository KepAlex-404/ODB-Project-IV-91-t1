def pretty_visor(res):
    answer = ''

    for col in res[0].keys():
        answer += col + ' | '
    answer += "\n"

    for line in res:
        for val in line.values():
            answer += str(val) + ' '
        answer += "\n"
    return answer