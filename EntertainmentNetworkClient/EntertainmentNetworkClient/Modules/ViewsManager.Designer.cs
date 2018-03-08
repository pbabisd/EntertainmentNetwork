﻿namespace EntertainmentNetworkClient.Modules
{
    partial class ViewsManager
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.citiesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.citiesViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cinemaViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cinemasBindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.citiesBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.citiesViewBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cinemaViewBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cinemasBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // citiesBindingSource
            // 
            this.citiesBindingSource.AllowNew = true;
            this.citiesBindingSource.AddingNew += new System.ComponentModel.AddingNewEventHandler(this.CitiesBindingSource_AddingNew);
            this.citiesBindingSource.CurrentChanged += new System.EventHandler(this.CitiesBindingSource_CurrentChanged);
            // 
            // cinemasBindingSource
            // 
            this.cinemasBindingSource.AllowNew = true;
            this.cinemasBindingSource.AddingNew += new System.ComponentModel.AddingNewEventHandler(this.CinemasBindingSource_AddingNew);
            this.cinemasBindingSource.CurrentChanged += new System.EventHandler(this.CinemasBindingSource_CurrentChanged);
            // 
            // ViewsManager
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Name = "ViewsManager";
            this.Size = new System.Drawing.Size(325, 291);
            ((System.ComponentModel.ISupportInitialize)(this.citiesBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.citiesViewBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cinemaViewBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cinemasBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.BindingSource cinemaViewBindingSource;
        private System.Windows.Forms.BindingSource cinemasBindingSource;
        private System.Windows.Forms.BindingSource citiesBindingSource;
        private System.Windows.Forms.BindingSource citiesViewBindingSource;

    }
}