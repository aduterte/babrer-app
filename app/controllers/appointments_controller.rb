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

    appointment = Appointment.find(params[:id])
    appointment.update(appointment_params)

    render json: appointment
  end

  def create
    # byebug
    appointment = Appointment.create({client_id: params['client_id'], barber_id: params['barber_id'], b_accepted:params['b_accepted'], c_accepted:params['c_accepted'], date: params['date'], completed: false})
        byebug
    render json: appointment
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    render json: {message: "item destroyed"}
  end

  private
  
  def appointment_params
    params.permit(:date, :barber_id, :client_id, :b_accepted, :c_accepted, :completed)
  end

end
