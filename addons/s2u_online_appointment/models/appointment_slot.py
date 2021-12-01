# -*- coding: utf-8 -*-

from odoo.addons.s2u_online_appointment.helpers import functions
from odoo import models, fields, api, _
from odoo.exceptions import ValidationError


class AppointmentSlot(models.Model):
    _name = 's2u.appointment.slot'
    _order = 'user_id, date, slot'
    _description = "Appointment Slot"

    user_id = fields.Many2one('res.users', string='User', required=True)
    slot = fields.Float('Slot', required=True)
    date = fields.Date(string='Date of meeting')

    @api.constrains('slot')
    def _slot_validation(self):
        for slot in self:
            if functions.float_to_time(slot.slot) < '00:00' or functions.float_to_time(slot.slot) > '23:59':
                raise ValidationError(_('The slot value must be between 0:00 and 23:59!'))
