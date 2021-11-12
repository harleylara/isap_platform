# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

from werkzeug import urls

from odoo import api, fields, models, _
from odoo.tools.translate import html_translate


class RecruitmentSource(models.Model):
    _inherit = 'hr.recruitment.source'

    url = fields.Char(compute='_compute_url', string='Url Parameters')

    @api.depends('source_id', 'source_id.name', 'job_id', 'job_id.company_id')
    def _compute_url(self):
        for source in self:
            source.url = urls.url_join(source.job_id.get_base_url(), "%s?%s" % (
                source.job_id.website_url,
                urls.url_encode({
                    'utm_campaign': self.env.ref('hr_recruitment.utm_campaign_job').name,
                    'utm_medium': self.env.ref('utm.utm_medium_website').name,
                    'utm_source': source.source_id.name
                })
            ))


class Applicant(models.Model):

    _inherit = 'hr.applicant'


    def website_form_input_filter(self, request, values):
        current_uid = self._uid
        user = self.env['res.users'].browse(current_uid)
        values['partner_name'] = user.name
        values['email_from'] = user.email
        values['student_id'] = current_uid
        if 'partner_name' in values:
            applicant_job = self.env['hr.job'].sudo().search(
                [('id', '=', values['job_id'])]).name if 'job_id' in values else False
            name = '%s - %s' % (values['partner_name'], applicant_job) if applicant_job else _(
                "%s's Application", values['partner_name'])
            values.setdefault('name', name)
        if values.get('job_id'):
            stage = self.env['hr.recruitment.stage'].sudo().search([
                ('fold', '=', False),
                '|', ('job_ids', '=', False), ('job_ids',
                                               '=', values['job_id']),
            ], order='sequence asc', limit=1)
            if stage:
                values['stage_id'] = stage.id
        return values


class Job(models.Model):

    _name = 'hr.job'
    _inherit = ['hr.job', 'website.seo.metadata',
                'website.published.multi.mixin']

    def _get_default_website_description(self):
        default_description = self.env.ref(
            "website_hr_recruitment.default_website_description", raise_if_not_found=False)
        return (default_description._render() if default_description else "")

    website_published = fields.Boolean(
        help='Set if the application is published on the website of the company.')
    website_description = fields.Html('Website description', translate=html_translate, sanitize_attributes=False,
                                      default=_get_default_website_description, prefetch=False, sanitize_form=False)

    def _compute_website_url(self):
        super(Job, self)._compute_website_url()
        for job in self:
            job.website_url = "/jobs/detail/%s" % job.id

    def set_open(self):
        self.write({'website_published': False})
        return super(Job, self).set_open()

    def get_backend_menu_id(self):
        return self.env.ref('hr_recruitment.menu_hr_recruitment_root').id


# class Students(models.Model):
#     _name = 'hr.students'
#     _inherit = 'res.users'
#     _description = "The model of students (applicant for ISAP programs)"

#     groups_id = fields.Many2many(
#         'res.groups', 'res_groups_hr_students_rel', 'uid', 'gid', string='Groups')
#     company_ids = fields.Many2many(
#         'res.company', 'res_company_hr_student_rel', 'user_id', 'cid', string='Companies')

#     # application_ids = fields.Many2many(
#     #     'hr.applicant',
#     #     'hr_applicant_hr_students_rel',
#     #     'id',
#     #     'id',
#     #     string='Application Ids')

#     def init(self):
#         cr = self.env.cr
#         student_ids = []

#         cr.execute("""
#         SELECT id FROM res_groups
#         WHERE name='Portal'
#         """)

#         portal_id = cr.fetchone()[0]
#         print("portal id: " + str(portal_id))

#         cr.execute("""
#         SELECT uid FROM res_groups_users_rel
#         WHERE gid=%s
#         """, [portal_id])

#         if self.env.cr.rowcount:
#             for uid in cr.fetchall():
#                 student_ids.append(uid[0])
#         print("student_ids: "+str(student_ids))

#         for student_id in student_ids:
#             cr.execute("""
#             SELECT id FROM hr_applicant
#             WHERE student_id=%s
#             """, [student_id])
#             print(str(student_id) + ": " + str(cr.fetchall()))
