using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using MimeKit;
using PFE.HOTIX.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace WorkerService1
{
    public class Worker : BackgroundService
    {
        private readonly ILogger<Worker> _logger;

        public Worker(ILogger<Worker> logger)
        {
            _logger = logger;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {

                Reservations _AllReservations = PFE.HOTIX.Repository.Reservation.GetAll(-1, -1);

                Reservations _ConfReservations = new Reservations(_AllReservations.Where(r => r.Etat_demande.id_etat_demande == (int)PFE.HOTIX.Entities.Enumeration.EtatDemande.CONFIRMER).ToList());

                foreach (var resa in _ConfReservations)
                {
                    if (resa.datefinresevation < DateTime.Now)
                    {
                        PFE.HOTIX.Repository.Reservation.Archiver(resa);
                        PFE.HOTIX.Entities.Voiture _voiture = PFE.HOTIX.Repository.Voiture.GetOne(resa.Voiture.matricule_voiture.Trim());
                        _voiture.Etat.id_etat = (int)PFE.HOTIX.Entities.Enumeration.Etat.DISPONIBLE;
                        PFE.HOTIX.Repository.Voiture.Update(_voiture);
                    }



                }

            }
        }









    }
}