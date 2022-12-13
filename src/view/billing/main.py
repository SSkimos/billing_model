import sys
from random import randint
import psycopg2
import string

from PyQt5.QtWidgets import (
    QApplication,
    QLabel,
    QMainWindow,
    QPushButton,
    QVBoxLayout,
    QWidget,
    QTableWidget,
)


class AnotherWindow(QWidget):
    def __init__(self):
        super().__init__()
        layout = QVBoxLayout()

        conn = psycopg2.connect(
            host="localhost",
            database="billing_system",
            user="postgres",
            password="321",
            port=9876)

        cursor = conn.cursor()
        sel = "select * from customer;"
        cursor.execute(sel)
        text = cursor.fetchall()

        print(text)
        self.label = QLabel("string.join(text)")
        layout.addWidget(self.label)
        self.setLayout(layout)




class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.window1 = AnotherWindow()
        self.window2 = AnotherWindow()

        l = QVBoxLayout()
        button1 = QPushButton("Push for Window 1")
        button1.clicked.connect(
            lambda checked: self.toggle_window(self.window1)
        )
        l.addWidget(button1)

        button2 = QPushButton("Push for Window 2")
        button2.clicked.connect(
            lambda checked: self.toggle_window(self.window2)
        )
        l.addWidget(button2)

        w = QWidget()
        w.setLayout(l)
        self.setCentralWidget(w)

    def toggle_window(self, window):
        if window.isVisible():
            window.hide()

        else:
            window.show()


app = QApplication(sys.argv)
w = MainWindow()
w.show()
app.exec()