#Sure! You can use Python’s built-in tkinter module to create a GUI interface and use Python’s built-in difflib module to perform partial completion matching on a dictionary of words.

#Here’s an example code snippet that demonstrates how you can use these modules together:

import tkinter as tk
import difflib

# dictionary = ["apple", "banana", "cherry", "date", "elderberry", "fig", "grape"]

# def get_matches(partial):
#     matches = difflib.get_close_matches(partial, dictionary)
#     return matches

# def on_keyrelease(event):
#     value = event.widget.get()
#     matches = get_matches(value)
#     listbox.delete(0, tk.END)
#     for item in matches:
#         listbox.insert(tk.END, item)

# root = tk.Tk()
# entry = tk.Entry(root)
# entry.pack()
# listbox = tk.Listbox(root)
# listbox.pack()
# entry.bind('<KeyRelease>', on_keyrelease)
# root.mainloop()

import tkinter as tk

root = tk.Tk()
root.title("Exercise Lookup")

# Create labels and entry boxes for each column
name_label = tk.Label(root, text="Name")
name_label.grid(row=0, column=0)
name_entry = tk.Entry(root)
name_entry.grid(row=0, column=1)

etype_label = tk.Label(root, text="EType")
etype_label.grid(row=1, column=0)
etype_entry = tk.Entry(root)
etype_entry.grid(row=1, column=1)

main_muscle_label = tk.Label(root, text="Main Muscle")
main_muscle_label.grid(row=2, column=0)
main_muscle_entry = tk.Entry(root)
main_muscle_entry.grid(row=2, column=1)

secondary_muscle_label = tk.Label(root, text="Secondary Muscle")
secondary_muscle_label.grid(row=3, column=0)
secondary_muscle_entry = tk.Entry(root)
secondary_muscle_entry.grid(row=3, column=1)

equipment_label = tk.Label(root, text="Equipment")
equipment_label.grid(row=4, column=0)
equipment_entry = tk.Entry(root)
equipment_entry.grid(row=4, column=1)

mechanics_label = tk.Label(root, text="Mechanics")
mechanics_label.grid(row=5, column=0)
mechanics_entry = tk.Entry(root)
mechanics_entry.grid(row=5, column=1)

level_label = tk.Label(root, text="Level")
level_label.grid(row=6, column=0)
level_entry = tk.Entry(root)
level_entry.grid(row=6, column=1)

sport_label = tk.Label(root, text="Sport")
sport_label.grid(row=7, column=0)
sport_entry = tk.Entry(root)
sport_entry.grid(row=7, column=1)

force_label = tk.Label(root, text="Force")
force_label.grid(row=8, column=0)
force_entry = tk.Entry(root)
force_entry.grid(row=8, column=1)

root.mainloop()