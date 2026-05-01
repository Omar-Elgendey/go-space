from flask import Flask, render_template, request, redirect, url_for,  session
import mysql.connector
import os

app = Flask(__name__, template_folder="frontend/templates", static_folder="frontend")
app.secret_key = "gospace_secret_key"
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="Gospace",
    )
    return connection

@app.route("/")
def home():
    return render_template("test.html")

@app.route("/places")
def places():
    return render_template("place.html")

@app.route("/booking", methods=["GET", "POST"])
def booking():
    return render_template("booking.html")

@app.route("/creatAccount", methods=["GET", "POST"])
def creat_account():
    if request.method == "POST":
        firstname = request.form["firstname"]
        secondname = request.form["secondname"]
        username = firstname + " " + secondname
        email = request.form["email"]
        phone = request.form["phone"]
        password = request.form["password"]
        confirm_password = request.form["confirm_password"]


        if password != confirm_password:
            return "Passwords do not match"

        connection = get_db_connection()
        cursor = connection.cursor()

        sql = """
        INSERT INTO User (Username, Password, Phone, Email)
        VALUES (%s, %s, %s , %s)
        """
        values = (username, password, phone, email)

        cursor.execute(sql, values)
        connection.commit()

        cursor.close()
        connection.close()

        return redirect(url_for("signin"))

    return render_template("creatAccount.html")

@app.route("/signin", methods=["GET", "POST"])
def signin():
    if request.method == "POST":
        email = request.form["email"]
        password = request.form["password"]

        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        sql = "SELECT * FROM User WHERE Email=%s AND Password=%s"
        values = (email, password)

        cursor.execute(sql, values)
        user = cursor.fetchone()

        cursor.close()
        connection.close()

        if user:
            session["logged_in"] = True
            session["user_name"] = user["Username"]
            return redirect(url_for("home"))
        else:
            return "Invalid email or password"

    return render_template("signin.html")

if __name__ == "__main__":
    @app.route("/logout")
    def logout():
        session.clear()
        return redirect(url_for("home"))

@app.route("/save_booking", methods=["POST"])
def save_booking():
    fullname = request.form["fullname"]
    email = request.form["email"]
    room_type = request.form["room_type"]
    attendees = request.form["attendees"]
    booking_date = request.form["booking_date"]
    booking_time = request.form["booking_time"]
    payment_method = request.form["payment_method"]

    connection = get_db_connection()
    cursor = connection.cursor()

    sql = """
    INSERT INTO Bookings
    (Full_Name, Email, Room_Type, Attendees, Booking_Date, Booking_Time, Payment_Method)
    VALUES (%s, %s, %s, %s,  %s, %s, %s)
    """

    values = (
        fullname,
        email,
        room_type,
        attendees,
        booking_date,
        booking_time,
        payment_method
    )

    cursor.execute(sql, values)
    connection.commit()

    cursor.close()
    connection.close()

    return "Booking Confirmed"

if __name__ == "__main__":
    app.run(debug=True)