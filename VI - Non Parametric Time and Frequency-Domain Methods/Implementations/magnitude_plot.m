function magnitude_plot(w_approximate,w_groundTruth,G_approximate, G_groundTruth,legend_approximate,legend_groundTruth)
    loglog(w_approximate,G_approximate);
    hold on
    loglog(w_groundTruth,G_groundTruth,'LineWidth',1.4);
    grid;
    yticks([ 0.1 1 10 100]);
    yticklabels({'10^{-1}','10^0','10^1', '10^2'});
    %xticks([0.01 0.1 1 10])
    %xticklabels({'10^-2','10^-1','10^0','10^1','10^1'})
    ylim([1e-1 1e2]);
    xlabel('$\omega$(rad)','Interpreter','Latex');
    ylabel('Magnitude(dB)');
    %xlim([0.001 10])
    legend({legend_approximate,legend_groundTruth},'Interpreter','Latex','Location','northwest');
end
