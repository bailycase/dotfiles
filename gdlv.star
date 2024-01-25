
def command_find_array(arr, pred):
	"""Calls pred for each element of the array or slice 'arr' returns the index of
the first element for which pred returns true.

	
	find_array <arr>, <pred>
	
Example use:
	
	find_array "s2", lambda x: x.A == 5
"""
	arrv = eval(None, arr).Variable
	for i in range(0, arrv.Len):
		v = arrv.Value[i]
		if pred(v):
			print("found", i)
			return

	print("not found")

def Ll(var_name, next_field_name, max_depth):
	v = eval(None, var_name).Variable.Value
	r = []
	for i in range(0, max_depth):
		r.append(v)
		if v[0] == None:
			break
		v = v[next_field_name]
	return r

def command_linked_list(args):
	"""Prints the contents of a linked list.
	
	linked_list <var_name> <next_field_name> <max_depth>

Prints up to max_depth elements of the linked list variable 'var_name' using 'next_field_name' as the name of the link field.
"""
	var_name, next_field_name, max_depth = args.split(" ")
	max_depth = int(max_depth)
	next_name = var_name
	v = Ll(var_name, next_field_name, max_depth)
	for i in range(len(v)):
		print(str(i)+":", v)

def command_flaky(args):
	"Continues and restarts the target program repeatedly, until a breakpoint is hit"
	count = 1
	while True:
		if dlv_command("continue") == None:
			break
		print("restarting", count, "...")
		count = count+1
		restart(Rerecord=True)

