module main
struct LinkedList {
mut:
    len int
    head ?&ListNode = none
}
struct ListNode {
    val int
    node ?&ListNode = none
}

fn new() LinkedList {
    return LinkedList{}
}

fn from_array(array []int) LinkedList {
    mut list := new()
    for value in array { list.push(value) }
    return list
}

fn (list LinkedList) is_empty() bool {
    return list.len == 0
}

fn (mut list LinkedList) push(data int) {
    list.head = &ListNode {
        val: data
        node: list.head or { none }
    }
    list.len++
}

fn (mut list LinkedList) pop() ?int {
    data := list.peek()?
    list.head = (*list.head?).node?
    list.len--
    return data
}

fn (list LinkedList) peek() ?int {
    return (*list.head?).val
}

fn (list LinkedList) to_array() []int {
    mut lst := list.reverse()
    mut arr := []int{ cap: lst.len }
    for _ in 0 .. 2 * lst.len + 1 {
        arr << lst.pop() or { continue }
    }
    return arr
}

fn (list LinkedList) reverse() LinkedList {
    mut lst := list
    mut ans := new()
    for _ in 0 .. 2 * lst.len + 1 {
        ans.push(lst.pop() or { continue } )
    }
    return ans
}