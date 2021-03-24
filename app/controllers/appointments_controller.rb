class AppointmentsController < ApplicationController
  def index
    appointments = Appointment.all
    render json: appointments.to_json
  end

  def show
    appointment = Appointment.find(params[:id])
    render json: appointment
  end

  def update
    # byebug
    appointment = Appointment.find(params[:id])
    appointment.update(appointment_params)
    render json: appointment
  end

  def create
    # byebug
    appointment = Appointment.create(appointment_params)
    
    render json: appointment
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    render json: {message: "item destroyed"}
  end

  private
  
  def appointment_params
    params.require(:appointment).permit(:date, :barber_id, :client_id, :b_accepted, :c_accepted, :completed)
  end

end
