# set / get Node value

a_node = Tree.Node("some_value")
@test a_node.value == "some_value"

another_node = Tree.Node("different_value")
@test another_node.value == "different_value"

@test a_node.value == "some_value"

# set Node children & parent

parent_node = Tree.Node("parent")
child_node = Tree.Node("child_1")
Tree.add_children(parent_node, [child_node])

@test length(parent_node.children) == 1

another_child_node = Tree.Node("child_2")
third_child_node = Tree.Node("child_3")
Tree.add_children(parent_node, [another_child_node, third_child_node])

@test length(parent_node.children) == 3

# get Node children

@test parent_node.children == [child_node, another_child_node, third_child_node]

# get Node parent

@test get(child_node.parent) == parent_node
@test get(another_child_node.parent) == parent_node
@test get(third_child_node.parent) == parent_node

# check if Node is leaf (no children)

@test Tree.is_leaf(child_node) == true
@test Tree.is_leaf(parent_node) == false

# check if Node is root (no parent)

@test Tree.is_root(parent_node) == true
@test Tree.is_root(child_node) == false

# check if Node is ancestor (above/parent) of other Node

grandchild_node = Tree.Node("grandchild")
Tree.add_children(child_node, [grandchild_node])

@test Tree.is_ancestor(parent_node, child_node) == true
@test Tree.is_ancestor(parent_node, grandchild_node) == true
@test Tree.is_ancestor(child_node, grandchild_node) == true

@test Tree.is_ancestor(child_node, parent_node) == false
@test Tree.is_ancestor(grandchild_node, parent_node) == false
@test Tree.is_ancestor(grandchild_node, child_node) == false

# check if Node is descendant (below/child) of other Node

@test Tree.is_descendant(child_node, parent_node) == true
@test Tree.is_descendant(grandchild_node, parent_node) == true
@test Tree.is_descendant(grandchild_node, child_node) == true

@test Tree.is_descendant(parent_node, child_node) == false
@test Tree.is_descendant(parent_node, grandchild_node) == false
@test Tree.is_descendant(child_node, grandchild_node) == false

# check if Node is sibling (same parent) of other Node

@test Tree.is_sibling(child_node, another_child_node) == true
@test Tree.is_sibling(child_node, third_child_node) == true
@test Tree.is_sibling(another_child_node, third_child_node) == true

@test Tree.is_sibling(child_node, grandchild_node) == false
@test Tree.is_sibling(parent_node, grandchild_node) == false
