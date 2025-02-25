using System;
using System.ServiceProcess;
using System.Timers;

namespace MonService
{
    public partial class MonService : ServiceBase
    {
        private Timer timer;

        public MonService()
        {
            InitializeComponent();
        }

        private void InitializeComponent()
        {
            throw new NotImplementedException();
        }

        protected override void OnStart(string[] args)
        {
            timer = new Timer();
            timer.Interval = 5000; // 5 secondes
            timer.Elapsed += new ElapsedEventHandler(Timer_Tick);
            timer.Enabled = true;
        }

        protected override void OnStop()
        {
            timer.Enabled = false;
            timer.Dispose();
        }

        private void Timer_Tick(object sender, ElapsedEventArgs e)
        {
            Console.WriteLine("Service en cours d'exécution...");
        }
    }
}
